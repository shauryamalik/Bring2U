from flask import Flask, render_template, request, redirect
import sys
app = Flask(__name__)


f = open('./config','r')
cont = f.read()
if cont=="1":
    var = True
else:
    var = False


if var:
    @app.route('/')
    def student():
       return render_template('hello.html')

    @app.route('/result', methods = ['POST', 'GET'])
    def result():
       if request.method == 'POST':
        result = request.form
        result = str(result)
        print(result, file=sys.stdout)
        teq = result.split("'")
        #print(teq[3], file=sys.stdout)
        #print(teq[7], file=sys.stdout)
        f1 = open('./tmp.csv','a')
        f1.write(teq[3] + ',' + teq[7] + '\n')
        f1.close()
        

        
        # f1.close()
        # f2 = open('./GPS_info.csv','a')
        # f2.write(df + '\n')
        # f2.close()
        # var = True
        #return render_template("student.html",result = result)
        return redirect('/')
        # print(var, file=sys.stdout)
        # return var



if __name__ == '__main__': 
    var = 1
    if var == 0:
        app.run(debug = True)
    

