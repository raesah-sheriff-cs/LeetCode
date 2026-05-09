class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        list1 = []
        list2 = []

        while l1:
            list1.append(l1.val)
            l1 = l1.next
        while l2:
            list2.append(l2.val)
            l2 = l2.next

        list1 = list1[::-1]
        list2 = list2[::-1]

        total = int("".join(map(str, list1))) + int("".join(map(str, list2)))
        lr = [int(d) for d in str(total)][::-1]

        def list_to_linked_list(lst):
            dummy = ListNode()
            current = dummy
            for val in lst:
                current.next = ListNode(val)
                current = current.next
            return dummy.next

        return list_to_linked_list(lr)