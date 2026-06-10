	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_801D740, "ax", %progbits
@ sub_801D740 @ JP 0x0801D740 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D740
	.thumb_func
sub_801D740:
	push {r4, lr}
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801D76E
	ldr r0, [r4]
	cmp r0, #0
	beq _0801D76E
	ldr r0, [r4, #0xc]
	ldr r1, _0801D774 @ =0x00010007
	ands r0, r1
	cmp r0, #0
	bne _0801D76E
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _0801D76E
	cmp r1, #2
	bne _0801D778
_0801D76E:
	movs r0, #0
	b _0801D7A2
	.align 2, 0
_0801D774: .4byte 0x00010007
_0801D778:
	ldr r0, _0801D7A8 @ =0x085C2F58
	bl Proc_Find
	cmp r0, #0
	bne _0801D788
	ldr r0, _0801D7AC @ =0x085C609C
	bl Proc_Find
_0801D788:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl sub_8015E18
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetCursorMapPosition
	movs r0, #1
_0801D7A2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801D7A8: .4byte 0x085C2F58
_0801D7AC: .4byte 0x085C609C

