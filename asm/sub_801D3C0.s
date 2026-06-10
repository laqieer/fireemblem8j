	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8018370, 0x08018370 + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_801D3C0, "ax", %progbits
@ sub_801D3C0 @ JP 0x0801D3C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D3C0
	.thumb_func
sub_801D3C0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801D43C @ =0x085C2F58
	bl Proc_Find
	cmp r0, #0
	beq _0801D436
	movs r1, #9
	bl Proc_Goto
	ldr r4, _0801D440 @ =0x03004DF0
	ldr r0, [r4]
	cmp r0, #0
	beq _0801D3EC
	bl sub_807B4B8
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
_0801D3EC:
	ldr r2, _0801D444 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl sub_801D730
	bl RefreshEntityBmMaps
	bl sub_8027144
	adds r0, r5, #0
	bl sub_8018370
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r1, _0801D448 @ =0x0202BE44
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl SetCursorMapPosition
	bl RefreshEntityBmMaps
	bl sub_8027144
_0801D436:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D43C: .4byte 0x085C2F58
_0801D440: .4byte 0x03004DF0
_0801D444: .4byte 0x0202BCAC
_0801D448: .4byte 0x0202BE44

