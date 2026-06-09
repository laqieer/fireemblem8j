	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B26E4, "ax", %progbits
@ sub_80B26E4 @ JP 0x080B26E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B26E4
	.thumb_func
sub_80B26E4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B2704 @ =0x08A9DCD4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B26FE
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
_080B26FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2704: .4byte 0x08A9DCD4

