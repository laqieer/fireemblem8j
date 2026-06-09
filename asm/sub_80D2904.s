	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80D2904, "ax", %progbits
@ sub_80D2904 @ JP 0x080D2904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2904
	.thumb_func
sub_80D2904:
	push {r4, lr}
	ldr r1, [r0, #0x14]
	ldr r4, [r1, #0x14]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D291E
	cmp r0, #1
	beq _080D2922
	cmp r0, #2
	beq _080D2922
_080D291E:
	movs r0, #0
	b _080D2932
_080D2922:
	adds r0, r1, #0
	bl Proc_End
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #0xb
_080D2932:
	pop {r4}
	pop {r1}
	bx r1

