	.syntax unified
	.set Proc_FindAfter, 0x080033B8 + 1
	.section .text.sub_80B1DD8, "ax", %progbits
@ sub_80B1DD8 @ JP 0x080B1DD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1DD8
	.thumb_func
sub_80B1DD8:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	b _080B1DEA
_080B1DE0:
	ldr r0, [r1, #0x2c]
	cmp r0, r4
	bne _080B1DEA
	adds r0, r1, #0
	b _080B1DF8
_080B1DEA:
	ldr r0, _080B1E00 @ =0x08A9DB6C
	bl Proc_FindAfter
	adds r1, r0, #0
	cmp r1, #0
	bne _080B1DE0
	movs r0, #0
_080B1DF8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B1E00: .4byte 0x08A9DB6C

