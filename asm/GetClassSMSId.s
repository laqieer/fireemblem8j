	.syntax unified
	.section .text.GetClassSMSId, "ax", %progbits
@ GetClassSMSId @ JP 0x08018AA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetClassSMSId
	.thumb_func
GetClassSMSId:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bgt _08018AB0
	movs r0, #0
	b _08018AB8
_08018AB0:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _08018AC0 @ =0x0885B668
	adds r0, r1, r0
_08018AB8:
	ldrb r0, [r0, #6]
	pop {r1}
	bx r1
	.align 2, 0
_08018AC0: .4byte 0x0885B668

