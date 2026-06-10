	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8011640, "ax", %progbits
@ sub_8011640 @ JP 0x08011640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011640
	.thumb_func
sub_8011640:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r3, #7
	bhi _0801165C
	ldr r0, _08011658 @ =0x085BA094
	adds r1, r3, #0
	bl sub_8002BCC
	b _08011664
	.align 2, 0
_08011658: .4byte 0x085BA094
_0801165C:
	ldr r0, _08011684 @ =0x085BA094
	adds r1, r3, #0
	bl Proc_StartBlocking
_08011664:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0801167E
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0801167E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011684: .4byte 0x085BA094

