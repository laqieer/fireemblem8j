	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C57DC, "ax", %progbits
@ sub_80C57DC @ JP 0x080C57DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C57DC
	.thumb_func
sub_80C57DC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C57F8 @ =0x08AC2278
	bl Proc_Find
	ldr r0, [r0, #0x2c]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _080C57FC
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	b _080C5804
	.align 2, 0
_080C57F8: .4byte 0x08AC2278
_080C57FC:
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _080C580C @ =0x0000063F
	strh r0, [r1]
_080C5804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C580C: .4byte 0x0000063F

