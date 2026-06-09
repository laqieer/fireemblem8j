	.syntax unified
	.set SetIRQHandler, 0x08000B50 + 1
	.section .text.sub_8001C78, "ax", %progbits
@ sub_8001C78 @ JP 0x08001C78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001C78
	.thumb_func
sub_8001C78:
	push {r4, lr}
	ldr r0, _08001C9C @ =0x030030D4
	ldr r3, [r0]
	rsbs r0, r3, #0
	orrs r0, r3
	lsrs r2, r0, #0x1f
	ldr r0, _08001CA0 @ =0x030036E8
	ldr r4, [r0]
	cmp r4, #0
	beq _08001C8E
	adds r2, #2
_08001C8E:
	cmp r2, #1
	beq _08001CD0
	cmp r2, #1
	bgt _08001CA4
	cmp r2, #0
	beq _08001CAE
	b _08001D14
	.align 2, 0
_08001C9C: .4byte 0x030030D4
_08001CA0: .4byte 0x030036E8
_08001CA4:
	cmp r2, #2
	beq _08001CE4
	cmp r2, #3
	beq _08001CF8
	b _08001D14
_08001CAE:
	ldr r2, _08001CC4 @ =0x03003020
	ldrb r1, [r2, #4]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #4]
	ldr r2, _08001CC8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001CCC @ =0x0000FFFD
	ands r0, r1
	b _08001D12
	.align 2, 0
_08001CC4: .4byte 0x03003020
_08001CC8: .4byte 0x04000200
_08001CCC: .4byte 0x0000FFFD
_08001CD0:
	ldr r2, _08001CE0 @ =0x03003020
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #1
	adds r1, r3, #0
	b _08001D06
	.align 2, 0
_08001CE0: .4byte 0x03003020
_08001CE4:
	ldr r2, _08001CF4 @ =0x03003020
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #1
	adds r1, r4, #0
	b _08001D06
	.align 2, 0
_08001CF4: .4byte 0x03003020
_08001CF8:
	ldr r2, _08001D1C @ =0x03003020
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r1, _08001D20 @ =sub_8001C50
	movs r0, #1
_08001D06:
	bl SetIRQHandler
	ldr r2, _08001D24 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
_08001D12:
	strh r0, [r2]
_08001D14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001D1C: .4byte 0x03003020
_08001D20: .4byte 0x08001C51  @ sub_8001C50
_08001D24: .4byte 0x04000200

