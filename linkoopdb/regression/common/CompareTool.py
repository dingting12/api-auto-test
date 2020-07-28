import sys
import pandas
import os
import glob
from robot.api import logger

delta = 0.05

class CompareToolException(Exception):
    def __init__(self, message):
        Exception.__init__(self)
        self.message = message


class CompareTool(object):
    # TEST SUITE 在suite中引用，只会实例化一次
    # 也就是说多test case都引用了这个类的方法，但是只有第一个test case调用的时候实例化
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    # def __init__(self):
    #     pass


    def Compare_Csv_File(self, original_csv_file=None, ref_file=None):

        if original_csv_file is "":
            raise CompareToolException("Please provide path of original csv file(s)")
        if ref_file is None:
            raise CompareToolException("Please provide path of ref file(s)")

        if os.path.isdir(original_csv_file) and os.path.isdir(ref_file):
            tests = glob.glob(os.path.join(sys.argv[1], '*'))
            tests.sort()
            passing = 0
            failing = 0
            for test in tests:
                res = self.diff(test, os.path.join(sys.argv[2], os.path.basename(test)))
                if res['class'] == 'match':
                    passing = passing + 1
                else:
                    failing = failing + 1
                print("%s\t%s\t%s" % (os.path.basename(test).replace(".ans", ""), res['class'], res['group']))
        else:
            res = self.diff(original_csv_file, ref_file)
            logger.info(res)

    def load(self, fname):
        df = pandas.read_csv(fname, sep='\t', header=None)
        # convert all numbers to floats and strip all strings left/right
        for c in range(len(df.dtypes)):
            if (str(df.dtypes[c]).startswith('int')):
                df[c] = df[c].astype(float)
            if (str(df.dtypes[c]) == 'object'):
                df[c] = df[c].str.strip()

        return df

    def diff(self, f1, f2):
        if not os.path.exists(f1) or not os.path.exists(f2) or os.path.getsize(f1) == 0 or os.path.getsize(f2) == 0:
            return {'class': 'fail', 'group': '', 'message': "No result %s <> %s" % (f1, f2)}

        try:
            p1 = self.load(f1)
            p2 = self.load(f2)
        except:
            return {'class': 'fail', 'group': 'loader_exception', 'message': "failed to load file"}

        if len(p1.dtypes) != len(p2.dtypes):
            return {'class': 'diff', 'group': 'diff_column_count',
                    'message': "Different number of columns: %s:%d, %s:%d" % (f1, len(p1.dtypes), f2, len(p2.dtypes))}

        if not (p1.dtypes == p2.dtypes).all():
            return {'class': 'diff', 'group': 'diff_types', 'message': "Different data types %s <> %s" % (
            ', '.join([str(t) for t in p1.dtypes.tolist()]), ', '.join([str(t) for t in p2.dtypes.tolist()]))}

        if len(p1) != len(p2):
            return {'class': 'diff', 'group': 'diff_row_count',
                    'message': "Different number of rows: %s:%d, %s:%d" % (f1, len(p1), f2, len(p2))}

        diffs = 0

        for c in range(len(p1.dtypes)):
            v1 = p1[c]
            v2 = p2[c]
            if (str(p1.dtypes[c]) == "object"):
                diffs = diffs + (v1.astype(str) != v2.astype(str)).sum()

            if (str(p1.dtypes[c]) == "float64"):
                diffs = diffs + ((v1 - v2).abs() > (v1 * delta).abs()).sum()

        if diffs > 0:
            return {'class': 'diff', 'group': 'diff_data', 'message': "%s != %s, %d diffs" % (f1, f2, diffs)}

        return {'class': 'match', 'group': '',
                'message': "%s == %s, %d cols %d rows" % (f1, f2, len(p1.dtypes), len(p2))}


if __name__ == '__main__':
    a = CompareTool()
    a.Compare_Csv_File("./1.csv","./2.csv")
    pass