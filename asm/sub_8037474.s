	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8037474, "ax", %progbits
@ sub_8037474 @ JP 0x08037474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037474
	.thumb_func
sub_8037474:
	push {r4, lr}
	ldr r0, _0803749C @ =0x085C6A48
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080374A8
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080374A0
	bl sub_804F610
	adds r0, r4, #0
	bl Proc_End
	b _080374A8
	.align 2, 0
_0803749C: .4byte 0x085C6A48
_080374A0:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080374A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

