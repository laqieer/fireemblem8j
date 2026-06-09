	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8003A70, 0x08003A70 + 1
	.set sub_801B9B0, 0x0801B9B0 + 1
	.section .text.sub_801BA20, "ax", %progbits
@ sub_801BA20 @ JP 0x0801BA20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BA20
	.thumb_func
sub_801BA20:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801BA60 @ =0x085C2EDC
	bl Proc_Find
	adds r2, r0, #0
	ldr r0, _0801BA64 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq _0801BA58
	adds r2, #0x66
	ldrh r0, [r2]
	movs r1, #1
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_801B9B0
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_8003A70
_0801BA58:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BA60: .4byte 0x085C2EDC
_0801BA64: .4byte 0x085775CC

