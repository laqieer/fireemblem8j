	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_801D3C0, 0x0801D3C0 + 1
	.section .text.sub_8010770, "ax", %progbits
@ sub_8010770 @ JP 0x08010770 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010770
	.thumb_func
sub_8010770:
	push {r4, lr}
	ldr r0, [r0, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl sub_800BF3C
	adds r4, r0, #0
	cmp r4, #0
	beq _08010794
	bl sub_801D3C0
	ldr r0, _08010790 @ =0x03004DF0
	str r4, [r0]
	movs r0, #0
	b _08010796
	.align 2, 0
_08010790: .4byte 0x03004DF0
_08010794:
	movs r0, #6
_08010796:
	pop {r4}
	pop {r1}
	bx r1

