function varargout = z1(varargin)
% Z1 MATLAB code for z1.fig
%      Z1, by itself, creates a new Z1 or raises the existing
%      singleton*.
%
%      H = Z1 returns the handle to a new Z1 or the handle to
%      the existing singleton*.
%
%      Z1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Z1.M with the given input arguments.
%
%      Z1('Property','Value',...) creates a new Z1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before z1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to z1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help z1

% Last Modified by GUIDE v2.5 18-Jul-2017 11:12:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @z1_OpeningFcn, ...
                   'gui_OutputFcn',  @z1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
global dan;
global zadanaTemperatura;
global temperatura1;
global brojRotacija;
global vrijeme;
global temperaturaDani;
global temperaturaDani1;
global temperaturaDani2;
global Kp;
global Ki;
global Kd;
% --- Executes just before z1 is made visible.
function z1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to z1 (see VARARGIN)

% Choose default command line output for z1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes z1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = z1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ulaz=digitalRead(a,'D4');
set(handles.edit1,'String','Nista');
if ulaz == 1
    set(handles.edit1,'String','Jedinica');
end
if ulaz == 0
    set(handles.edit1,'String','Nula');
end
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = arduino('COM12')
pinMode(a,4,'input');

% Hint: get(hObject,'Value') returns toggle state of togglebutton1



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

a=arduino('COM14');
zadanaTemperatura = str2num(get(handles.edit4,'String'));
if isempty(zadanaTemperatura)
    zadanaTemperatura=38;
end
zadanaTemperatura = zadanaTemperatura+273.15;
pinMode(a,2,'output')
pinMode(a,3,'output')
pinMode(a,4,'output')
pinMode(a,5,'output')
pin2=2;
pin3=3;
pin4=4;
pin5=5;
pinMode(a,9,'output');%PWM dimmer
pinMode(a,13,'output');
rotacijaGdje = 1;
e2=0;
e1=0;
temperatura1=0;
vrijeme=0;
u=0;
B1=3633;
A1=0.03962;
B2=3695;
A2=0.03832;
prethodno_2=0;
prethodno=0;
global dan;
dan=1;
brojRotacija=0;
global Kp;
global Ki;
global Kd;
global temperaturaDani;
global temperaturaDani1;
global temperaturaDani2;

temperaturaDani=273.15+25;
temperaturaDani1=273.15+25;
temperaturaDani2=273.15+25;
for i=1:504000 %GLAVNA PETLJA
dan1=rem(i,5);
if dan1 == 4
    dan=dan+1;
    brojRotacija=0;
end

av1=analogRead(a,1);
av1=(av1/1023)*5;
av2=analogRead(a,2);
av2=(av2/1023)*5;
srednjaVr=(av1+av2)/2;

R1=3900*av1/(5-av1);
Ts1=B1/log(R1/A1);
temperaturaDani1=[temperaturaDani1,Ts1];
R2=3900*av2/(5-av2);
Ts2=B2/log(R2/A2);
temperaturaDani2=[temperaturaDani2,Ts2];
trenutnaTemperatura=(Ts1+Ts2)/2;%temperatura
    temperaturaDani=[temperaturaDani,trenutnaTemperatura];
prethodno_2=prethodno;
prethodno=u;
e=zadanaTemperatura-trenutnaTemperatura;
%prebacivanje sa temperature u napon

%Re=((A1+A2)/2)*exp(((B1+B2)/2)/e);
%Ue=5*Re/(Re+3900) %zadani napon

Kp=20;
Ki=0.0001;
Kd=0;
Ts=1;
A=Kp+Ki*Ts/2;
B=-Kp+Ki*Ts/2;
C=Kd/Ts;
%u=prethodno+a1*e+b*e1+c*e2
u=A*e+B*e1+C*e2+prethodno;
if e < 1
Uizl=round(155/65*u+100);
else
    Uizl=255;
end
if Uizl>255
    Uizl=255;
end
if Uizl<0
    Uizl=0;
end

analogWrite(a,9,Uizl);
e2=e1;
e1=e;
rotacija = rem(dan,3);
if dan <= 18
    
    if dan1 ==1 | dan1 ==2 | dan1 == 3
        brojRotacija = brojRotacija+1;
        if rotacijaGdje == 0
            rotacijaGdje = 1;
        else
            rotacijaGdje = 0;
        end
    if rotacijaGdje==0
         for j=1:13 %uvlacenje
            digitalWrite(a,pin2,0);
            digitalWrite(a,pin3,0);
            digitalWrite(a,pin4,0);
            digitalWrite(a,pin5,1);
            pause(0.04);
            digitalWrite(a,pin2,0);
            digitalWrite(a,pin3,0);
            digitalWrite(a,pin4,1);
            digitalWrite(a,pin5,0);
            pause(0.04);
            digitalWrite(a,pin2,0);
            digitalWrite(a,pin3,1);
            digitalWrite(a,pin4,0);
            digitalWrite(a,pin5,0);
            pause(0.04);
            digitalWrite(a,pin2,1);
            digitalWrite(a,pin3,0);
            digitalWrite(a,pin4,0);
            digitalWrite(a,pin5,0);
            pause(0.04);
            
        end
    end
    if rotacijaGdje==1
        for k=1:13 %izvlacenje
            digitalWrite(a,pin2,1);
            digitalWrite(a,pin3,0);
            digitalWrite(a,pin4,0);
            digitalWrite(a,pin5,0);
            pause(0.04);
            digitalWrite(a,pin2,0);
            digitalWrite(a,pin3,1);
            digitalWrite(a,pin4,0);
            digitalWrite(a,pin5,0);
            pause(0.04);
            digitalWrite(a,pin2,0);
            digitalWrite(a,pin3,0);
            digitalWrite(a,pin4,1);
            digitalWrite(a,pin5,0);
            pause(0.04);
            digitalWrite(a,pin2,0);
            digitalWrite(a,pin3,0);
            digitalWrite(a,pin4,0);
            digitalWrite(a,pin5,1);
            pause(0.04);
            
        end
    end        
    end
else 
    brojRotacija = 0;
end
digitalWrite(a,pin2,0); %iskljucivanje napajanja faza
digitalWrite(a,pin3,0); %zbog manje potrosnje i zagrijavanja
digitalWrite(a,pin4,0);
digitalWrite(a,pin5,0);
Ts1=Ts1+5; %Drift nule
Ts1=Ts1-273.15;
Ts2=Ts2-273.15; %prebacivanje iz K u °C
%set(handles.text9,'String',Ts1);
set(handles.text6,'String',dan);
set(handles.text9,'String',trenutnaTemperatura-273.15);
set(handles.text10,'String',brojRotacija);
if dan==20
    zadanaTemperatura=35+273.15; %smanjiti temperaturu na 35°C dan prije kraja
end
if dan==21
    set(handles.text6,'String','Zavrseno');
   break;
end
pause(1.5);
end
delete(a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temperaturaDani;
global temperaturaDani1;
global temperaturaDani2;
global dan;
listBox = get(handles.listbox1,'Value');
if listBox == 1
    t=linspace(0,dan,size(temperaturaDani1,2));
    plot(t,temperaturaDani1-273.15,'r');
    axis([0 21 0 60]); 
    grid on;
    title('Temperatura - senzor 1');
    xlabel('Dani');
    ylabel('Temperatura[°C]');
end
if listBox == 2
        t=linspace(0,dan,size(temperaturaDani2,2));
        plot(t,temperaturaDani2-273.15,'r');
        axis([0 21 0 60]); 
        grid on;
        title('Temperatura - senzor 2');
        xlabel('Dani');
        ylabel('Temperatura[°C]');
end
if listBox==3
        %t=1:size(temperaturaDanas1,2);
        t=linspace(0,dan,size(temperaturaDani,2));
        plot(t,temperaturaDani-273.15,'r');
        axis([0 21 0 60]); 
        grid on;
        title('Temperatura - srednja vrijednost mjerenja dva senzora');
        xlabel('Dani');
        ylabel('Temperatura[°C]');
end

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Kp;
global Ki;
global Kd;
Kp = str2num(get(handles.edit7,'String'));
if isempty(Kp)
    Kp=1;
end
Kp = str2num(get(handles.edit8,'String'));
if isempty(Kp)
    Ki=0;
end
Kp = str2num(get(handles.edit9,'String'));
if isempty(Kp)
    Kd=0;
end


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
global dan;
dan=21;

