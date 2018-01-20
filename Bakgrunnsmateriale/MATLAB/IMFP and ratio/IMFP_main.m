function varargout = IMFP_main(varargin)
% IMFP_main MATLAB code for IMFP_main.fig
%      IMFP_main, by itself, creates a new IMFP_main or raises the existing
%      singleton*.
%
%      H = IMFP_main returns the handle to a new IMFP_main or the handle to
%      the existing singleton*.
%
%      IMFP_main('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMFP_main.M with the given input arguments.
%
%      IMFP_main('Property','Value',...) creates a new IMFP_main or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IMFP_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IMFP_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IMFP_main

% Last Modified by GUIDE v2.5 01-Jul-2016 08:27:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IMFP_main_OpeningFcn, ...
                   'gui_OutputFcn',  @IMFP_main_OutputFcn, ...
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

% --- Executes just before IMFP_main is made visible.
function IMFP_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IMFP_main (see VARARGIN)

% Choose default command line output for IMFP_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using IMFP_main.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
    update(handles);
end

% UIWAIT makes IMFP_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IMFP_main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update(handles);


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
update(handles);

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

set(hObject, 'String', {'Al', 'Au', 'Br', 'C', 'Cd', 'Ga', 'Hg', 'O', 'Si', 'Te', 'Zn'});


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
update(handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Al', 'Al2O3', 'CdTe', 'Hg', 'HgTe', 'Si', 'Te', 'TeO'});

% --- Update.
function update(handles)
axes(handles.axes1);
cla;

% --- Calculate inelastic mean free path for
%     different photoelectrons as expressed by 
%     a certain peak in a material's XPS.
popup2_selected_value = get(handles.popupmenu2, 'Value');
popup2_string_list = get(handles.popupmenu2, 'String');
material_id = char(popup2_string_list(popup2_selected_value));
material = readParametersFromFile(strcat('param_', material_id, '.txt'));
text( 'Position', [0.0 1.0], 'Interpreter', 'latex', 'string', strcat('$N_\mathrm{V} = $', num2str(material.Nv),'. $M$ = ', num2str(material.M), ' g/mol. $\rho$ = ', num2str(material.rho), ' $\mathrm{g}/\mathrm{cm}^3$. $E_\mathrm{g}$ = ', num2str(material.Eg), ' eV'), 'Fontsize', 14);

% --- Get source of electrons.
popup1_selected_value = get(handles.popupmenu1, 'Value');
popup1_string_list = get(handles.popupmenu1, 'String');
electron_source_id = char(popup1_string_list(popup1_selected_value));

axes(handles.axes1);

% --- Set the energy of the Al Ka and Mg Ka x-rays [eV].
Al = 1486.6;
Mg = 1253.6;

% --- IMFP for electrons from Te.
[ nameE, E ] = readEnergiesFromFile(strcat('energy_', electron_source_id,'.txt'));
IMFP_Mg = TPP2M( Mg - E, material.Eg, material.rho, material.Nv, material.M );
IMFP_Al = TPP2M( Al - E, material.Eg, material.rho, material.Nv, material.M );
fprintf('\nElectrons emitted from %s in %s material\n', electron_source_id, material_id);
text( 'Position', [0.0 0.92], 'Interpreter', 'latex', 'string', 'Photoelectron line', 'FontSize', 14);
text( 'Position', [0.3 0.92], 'Interpreter', 'latex', 'string', 'IMFP for Mg K$\alpha$', 'Fontsize', 14);
text( 'Position', [0.6 0.92], 'Interpreter', 'latex', 'string', 'IMFP for Al K$\alpha$', 'Fontsize', 14);
for i = 1:length(E)
    fprintf('%s\tlambda(E_{Mg}) = %.3f\tlambda(E_{Al}) = %.3f\n', nameE{i}, IMFP_Mg(i), IMFP_Al(i));
    text( 'Position', [0.0 (1.0-(i+1)*0.08)], 'Interpreter', 'latex', 'string', nameE{i}, 'Fontsize', 14);
    text( 'Position', [0.3 (1.0-(i+1)*0.08)], 'Interpreter', 'latex', 'string', strcat('$\lambda(E_{\mathrm{Mg}}) = $', num2str(IMFP_Mg(i)), ' \AA'), 'Fontsize', 14);
    text( 'Position', [0.6 (1.0-(i+1)*0.08)], 'Interpreter', 'latex', 'string', strcat('$\lambda(E_{\mathrm{Al}}) = $', num2str(IMFP_Al(i)), ' \AA'), 'Fontsize', 14);
end
axis off
