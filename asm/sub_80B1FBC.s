	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80B1FBC, "ax", %progbits
@ sub_80B1FBC @ JP 0x080B1FBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1FBC
	.thumb_func
sub_80B1FBC:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _080B1FE4 @ =0x08A9DB84
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B1FFC
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	cmp r4, #0
	bne _080B1FE8
	adds r0, #0x35
	strb r4, [r0]
	b _080B1FF4
	.align 2, 0
_080B1FE4: .4byte 0x08A9DB84
_080B1FE8:
	adds r2, r1, #0
	adds r2, #0x35
	movs r0, #1
	strb r0, [r2]
	strh r4, [r1, #0x38]
	strh r7, [r1, #0x3c]
_080B1FF4:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080B1FFC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

