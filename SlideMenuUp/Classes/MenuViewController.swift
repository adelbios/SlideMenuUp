
public class MenuViewController : NSObject {
    
    
  public  var menuItem : [MenuDataSource] = [MenuDataSource]()
    
    public var tableViewRowHeight : CGFloat = 50
    public var headerTitle        : String?
    
    fileprivate var tableViewHeight  : CGFloat {
        return CGFloat(self.menuItem.count) * self.tableViewRowHeight + self.headerTitleHeight
    }
    
    fileprivate var headerTitleHeight: CGFloat {
        if self.headerTitle == nil {
            return 0.0
        }else{
            return 40
        }
    }
    
    fileprivate lazy var headerTitleLabel : UILabel = {
        let label = UILabel()
        label.font          = self.headerTextFont
        label.textColor     = self.headerTextColor
        label.textAlignment = self.headerTextAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let blackView : UIView = {
        let v = UIView()
        v.alpha = 0
        v.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return v
    }()
    
    
    fileprivate var tableViewHeightAncor  : NSLayoutConstraint?
    fileprivate var tableViewBottomtAncor : NSLayoutConstraint?
    fileprivate var fakeViewHeightAncor   : NSLayoutConstraint?
    
    
    
    fileprivate let fakeView : UIView  = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let t = UITableView(frame: .zero, style: .plain)
        t.backgroundColor = .white
        t.dataSource      = self
        t.delegate        = self
        t.separatorInset  = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        t.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: t.frame.size.width, height: 1))
        t.isScrollEnabled = false
        t.register(MenuCell.self, forCellReuseIdentifier: "cell")
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    public var didSelectItemWith:((_ index: Int) -> ())?
    
    public var menuItemTextColor : UIColor = .black
    public var menuItemTextFont  : UIFont  = .systemFont(ofSize: 15)
    public var menuIconColor     : UIColor = .clear
    
    
    public func show(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.animate()
        }
        
    }
    
    fileprivate func animate(){
        
        guard let window = UIApplication.shared.keyWindow else { return }
        self.tableViewHeightAncor?.constant = self.tableViewHeight
        
        UIDevice().detect(completion: { device in
            if device == .iphoneSmall  || device == .iphoneMiddel || device == .iphonePlus{
                self.tableViewBottomtAncor?.constant = 0
                self.fakeViewHeightAncor?.constant   = 0
            }else{
                self.fakeViewHeightAncor?.constant   = 20
                self.tableViewBottomtAncor?.constant = -20
            }
        })
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            window.layoutIfNeeded()
        })
    }
    
    public func dismiss(){
        guard let window = UIApplication.shared.keyWindow else { return }
        
        self.fakeViewHeightAncor?.constant   = 0
        self.tableViewBottomtAncor?.constant = 0
        self.tableViewHeightAncor?.constant  = 0
        
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            window.layoutIfNeeded()
        }
    }
    
    
    public override init() {
        super.init()
        self.setupUI()
    }
    
}

//MARK: - SetupUI
fileprivate extension  MenuViewController {
    
    func setupUI(){
        
        guard let window = UIApplication.shared.keyWindow else { return }
        window.addSubview(self.blackView)
        self.blackView.frame = window.frame
        window.addSubview(self.tableView)
        window.addSubview(self.fakeView)
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
            
            self.fakeView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            self.fakeView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
            self.fakeView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
            
            ])
        
        self.tableViewHeightAncor = self.tableView.heightAnchor.constraint(equalToConstant: 0)
        self.tableViewHeightAncor?.isActive = true
        
        self.tableViewBottomtAncor = self.tableView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
        self.tableViewBottomtAncor?.isActive = true
        
        self.fakeViewHeightAncor = self.fakeView.heightAnchor.constraint(equalToConstant: 0)
        self.fakeViewHeightAncor?.isActive = true
        
        
        
        self.blackView.addTapGestureRecognizer {
            self.dismiss()
        }
    }
    
}
//MARK: - UITableViewDataSource
extension MenuViewController :  UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItem.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.menuItem = self.menuItem[indexPath.row]
        
        cell.menuTextColor = self.menuItemTextColor
        cell.menuTextFont  = self.menuItemTextFont
        cell.iconColor     = self.menuIconColor
        
        return cell
    }
    
}
//MARK: - UITableViewDelegate
extension MenuViewController : UITableViewDelegate  {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectItemWith?(indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableViewRowHeight
    }
    
    public  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.headerTitleHeight
    }
    
    public  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let holderView = UIView()
        holderView.backgroundColor = UIColor(red:0.96, green:0.97, blue:0.97, alpha:1.0)
        self.headerTitle(holderView)
        return holderView
    }
    
    public func headerTitle(_ holderView: UIView) {
        holderView.addSubview(self.headerTitleLabel)
        
        NSLayoutConstraint.activate([
            self.headerTitleLabel.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
            self.headerTitleLabel.centerXAnchor.constraint(equalTo: holderView.centerXAnchor)
            ])
        self.headerTitleLabel.text = self.headerTitle
    }
}

//MARK: - Option
extension MenuViewController {
    
    public var headerTextFont : UIFont  {
        get { return UIFont.boldSystemFont(ofSize: 14) }
        set{ self.headerTitleLabel.font = newValue }
    }
    
    public var headerTextColor : UIColor {
        get { return .black }
        set { self.headerTitleLabel.textColor = newValue }
    }
    
    public var headerTextAlignment : NSTextAlignment {
        get { return .center }
        set { self.headerTitleLabel.textAlignment = newValue }
    }
    
}
