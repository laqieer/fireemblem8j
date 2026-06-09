	.syntax unified
	.set sub_8025364, 0x08025364 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_80228A4, "ax", %progbits
@ sub_80228A4 @ JP 0x080228A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80228A4
	.thumb_func
sub_80228A4:
	push {lr}
	ldr r0, _080228BC @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025364
	ldr r0, _080228C0 @ =0x085C5958
	bl sub_80507B0
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080228BC: .4byte 0x03004DF0
_080228C0: .4byte 0x085C5958

