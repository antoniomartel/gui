   This example is a low level implementation of a GUI using Observer Pattern and Interfaces and some Delphi characteristic as Frames and Actions
   Other techniques used are: Singleton Pattern and RTTI
   Using the combination of Actions and RTTI: There is no code in views
   Interfaces were used to implement the "is a" relationship to TView and TBoard (Observers)
   There is a small "Model management table" which keeps already opened objects in memory
   To test observer pattern open a customer and a sales order for that customer, modify attributes and apply changes
   Also notice the "Cancel changes" question when closing a edition view (with cancel button or cross in title bar) with no code in those views
   
   