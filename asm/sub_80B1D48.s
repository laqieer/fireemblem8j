	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80B1C70, 0x080B1C70 + 1
	.section .text.sub_80B1D48, "ax", %progbits
@ sub_80B1D48 @ JP 0x080B1D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1D48
	.thumb_func
sub_80B1D48:
	push {r4, lr}
	ldr r0, _080B1D70 @ =0x08A9DB3C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080B1D68
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #5
	bl sub_80B1C70
_080B1D68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D70: .4byte 0x08A9DB3C

