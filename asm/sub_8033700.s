	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8033700, "ax", %progbits
@ sub_8033700 @ JP 0x08033700 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033700
	.thumb_func
sub_8033700:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08033748 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0803371A
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_0803371A:
	adds r0, r3, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, [r3, #0x2c]
	ldr r5, [r3, #0x30]
	cmp r0, #0
	beq _0803374C
	movs r1, #0xf
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0803374C
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0803374C
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08033774
	.align 2, 0
_08033748: .4byte 0x085775CC
_0803374C:
	ldr r2, [r3, #0x34]
	adds r2, r4, r2
	str r2, [r3, #0x2c]
	ldr r0, [r3, #0x38]
	adds r0, r5, r0
	str r0, [r3, #0x30]
	ldr r1, _0803377C @ =0x0202BCAC
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08033774
	adds r0, r3, #0
	bl sub_8002DE4
_08033774:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803377C: .4byte 0x0202BCAC

