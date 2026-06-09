	.syntax unified
	.set HideMu, 0x0807BBE8 + 1
	.set MuCtr_CheckMoveDependency, 0x0807C688 + 1
	.set MuCtr_ExecREDA_0, 0x0807C74C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ShowUnitSprite, 0x080280C4 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807BFF4, 0x0807BFF4 + 1
	.section .text.sub_807C4D8, "ax", %progbits
@ sub_807C4D8 @ JP 0x0807C4D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C4D8
	.thumb_func
sub_807C4D8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3a]
	lsls r0, r0, #3
	ldr r1, [r5, #0x34]
	adds r4, r1, r0
	bl sub_807BFF4
	ldr r0, [r5, #0x30]
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807C4FE
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0807C57C
_0807C4FE:
	ldrb r0, [r4, #3]
	ldrh r1, [r4, #4]
	bl MuCtr_CheckMoveDependency
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0807C540
	ldr r0, _0807C524 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807C528
	ldrh r0, [r5, #0x3c]
	subs r0, #4
	b _0807C52C
	.align 2, 0
_0807C524: .4byte 0x085775CC
_0807C528:
	ldrh r0, [r5, #0x3c]
	subs r0, #1
_0807C52C:
	strh r0, [r5, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0807C540
	adds r0, r5, #0
	bl MuCtr_ExecREDA_0
	movs r0, #0
	b _0807C57C
_0807C540:
	ldrh r0, [r5, #0x3a]
	cmp r0, #0
	beq _0807C57A
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	bl ShowUnitSprite
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x30]
	bl HideMu
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0807C584 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r4, #0xb]
	strb r1, [r0]
	bl sub_8027144
_0807C57A:
	movs r0, #1
_0807C57C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807C584: .4byte 0x0202E4D4

