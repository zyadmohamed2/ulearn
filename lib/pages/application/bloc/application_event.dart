abstract class AppEvents{}

class TriggerAppEvent extends AppEvents{
  int index;
  TriggerAppEvent(this.index);
}