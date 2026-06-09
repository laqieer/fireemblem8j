	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8050B14, 0x08050B14 + 1
	.section .text.sub_800D668, "ax", %progbits
@ sub_800D668 @ JP 0x0800D668 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D668
	.thumb_func
sub_800D668:
	push {lr}
	ldrh r2, [r0, #0x3c]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800D6A0
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D6A0
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0800D6A0
	bl sub_8050B14
	cmp r0, #0
	bne _0800D6A0
	ldr r0, _0800D69C @ =0x08A13308
	bl Proc_Find
	cmp r0, #0
	bne _0800D6A0
	movs r0, #1
	b _0800D6A2
	.align 2, 0
_0800D69C: .4byte 0x08A13308
_0800D6A0:
	movs r0, #0
_0800D6A2:
	pop {r1}
	bx r1
	.align 2, 0

