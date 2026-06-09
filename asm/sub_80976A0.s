	.syntax unified
	.set SetGMapBaseMenuPid, 0x080C8E54 + 1
	.section .text.sub_80976A0, "ax", %progbits
@ sub_80976A0 @ JP 0x080976A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80976A0
	.thumb_func
sub_80976A0:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080976B8 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080976BC
	adds r0, r2, #0
	bl SetGMapBaseMenuPid
	b _080976C6
	.align 2, 0
_080976B8: .4byte 0x03005270
_080976BC:
	ldr r0, _080976CC @ =0x020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
_080976C6:
	pop {r0}
	bx r0
	.align 2, 0
_080976CC: .4byte 0x020121CC

