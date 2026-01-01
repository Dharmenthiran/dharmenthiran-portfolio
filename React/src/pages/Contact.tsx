import { motion } from "framer-motion";
import { Mail, MapPin, Phone, Send } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { useToast } from "@/hooks/use-toast";

const Contact = () => {
  const { toast } = useToast();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    toast({
      title: "Message Sent!",
      description: "Thank you for reaching out. I'll get back to you soon.",
    });
  };

  const contactInfo = [
    {
      icon: Mail,
      title: "Email",
      value: "tdharmenthiran@gmail.com",
      link: "mailto:tdharmenthiran@gmail.com",
    },
    {
      icon: Phone,
      title: "Phone",
      value: "+91 6383402108",
      link: "tel:+916383402108",
    },
    {
      icon: MapPin,
      title: "Location",
      value: "Coimbatore, Tamil Nadu, India",
      link: "https://www.google.com/maps?q=10.99975,77.046",
    },
  ];

  return (
    <div className="min-h-screen pt-24 md:pt-32 pb-20 md:pb-20">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center mb-12 md:mb-16"
        >
          <h1 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-bold mb-3 md:mb-4">
            <span className="gradient-text">Get In Touch</span>
          </h1>
          <p className="text-base sm:text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto px-4">
            Have a project in mind? Let's work together to bring your ideas to life
          </p>
        </motion.div>

        <div className="grid lg:grid-cols-2 gap-8 md:gap-12 max-w-6xl mx-auto">
          {/* Contact Form */}
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.2 }}
          >
            <Card className="glass p-6 md:p-8">
              <h2 className="text-xl md:text-2xl font-bold mb-4 md:mb-6">Send Me a Message</h2>
              <form onSubmit={handleSubmit} className="space-y-6">
                <div>
                  <label className="block text-sm font-medium mb-2">Name</label>
                  <Input
                    placeholder="Your name"
                    className="bg-background/50 border-primary/30 focus:border-primary"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium mb-2">Email</label>
                  <Input
                    type="email"
                    placeholder="your.email@example.com"
                    className="bg-background/50 border-primary/30 focus:border-primary"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium mb-2">Message</label>
                  <Textarea
                    placeholder="Tell me about your project..."
                    rows={6}
                    className="bg-background/50 border-primary/30 focus:border-primary resize-none"
                    required
                  />
                </div>
                <Button type="submit" className="w-full glow-primary group">
                  <Send className="mr-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                  Send Message
                </Button>
              </form>
            </Card>
          </motion.div>

          {/* Contact Info */}
          <motion.div
            initial={{ opacity: 0, x: 50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.4 }}
            className="space-y-6"
          >
            <Card className="glass p-6 md:p-8">
              <h2 className="text-xl md:text-2xl font-bold mb-4 md:mb-6">Contact Information</h2>
              <div className="space-y-6">
                {contactInfo.map((info, index) => (
                  <motion.a
                    key={index}
                    href={info.link}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.6 + index * 0.1 }}
                    className="flex items-start gap-4 p-4 rounded-lg hover:bg-primary/10 transition-colors group"
                  >
                    <div className="p-3 rounded-lg bg-primary/20 glow-primary group-hover:scale-110 transition-transform">
                      <info.icon className="h-5 w-5 text-primary" />
                    </div>
                    <div>
                      <p className="text-sm text-muted-foreground">{info.title}</p>
                      <p className="font-medium group-hover:text-primary transition-colors">
                        {info.value}
                      </p>
                    </div>
                  </motion.a>
                ))}
              </div>
            </Card>

            <Card className="glass p-6 md:p-8">
              <h2 className="text-xl md:text-2xl font-bold mb-3 md:mb-4">Let's Connect</h2>
              <p className="text-muted-foreground mb-6">
                I'm always open to discussing new projects, creative ideas, or opportunities to be part of your vision.
              </p>
              <div className="flex flex-col sm:flex-row gap-3 sm:gap-4">
                <Button 
                  variant="outline" 
                  className="flex-1 border-primary/50 hover:bg-primary/10"
                  asChild
                >
                  <a href="https://www.linkedin.com/in/dharmenthiran-t-248173276" target="_blank" rel="noopener noreferrer">
                    LinkedIn
                  </a>
                </Button>
                <Button 
                  variant="outline" 
                  className="flex-1 border-primary/50 hover:bg-primary/10"
                  asChild
                >
                  <a href="https://github.com/Dharmenthiran" target="_blank" rel="noopener noreferrer">
                    GitHub
                  </a>
                </Button>
              </div>
            </Card>
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default Contact;
