	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80328C0, "ax", %progbits
@ sub_80328C0 @ JP 0x080328C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80328C0
	.thumb_func
sub_80328C0:
	push {lr}
	adds r2, r0, #0
	ldr r1, _080328E4 @ =0x0203A568
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, _080328E8 @ =0x0203A4E8
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080328E0
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080328E0:
	pop {r0}
	bx r0
	.align 2, 0
_080328E4: .4byte 0x0203A568
_080328E8: .4byte 0x0203A4E8

