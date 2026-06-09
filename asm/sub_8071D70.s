	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F94, 0x08070F94 + 1
	.set sub_80710AC, 0x080710AC + 1
	.set sub_80710DC, 0x080710DC + 1
	.section .text.sub_8071D70, "ax", %progbits
@ sub_8071D70 @ JP 0x08071D70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071D70
	.thumb_func
sub_8071D70:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8070F08
	ldr r0, _08071DBC @ =0x0860428C
	adds r1, r5, #0
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _08071DC0 @ =0x086F6364
	ldr r3, _08071DC4 @ =0x086F6198
	adds r0, r4, #0
	movs r1, #1
	bl sub_8070F94
	str r0, [r5, #0x60]
	ldrh r1, [r0, #2]
	subs r1, #0x38
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	adds r1, #0x18
	strh r1, [r0, #4]
	ldr r0, [r5, #0x5c]
	ldr r1, _08071DC8 @ =0x086F5FD4
	bl sub_80710DC
	ldr r0, [r5, #0x5c]
	ldr r1, _08071DCC @ =0x086F5C7C
	bl sub_80710AC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071DBC: .4byte 0x0860428C
_08071DC0: .4byte 0x086F6364
_08071DC4: .4byte 0x086F6198
_08071DC8: .4byte 0x086F5FD4
_08071DCC: .4byte 0x086F5C7C

