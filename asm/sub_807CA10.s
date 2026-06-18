	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set sub_801A304, 0x0801A304 + 1
	.set sub_802EA48, 0x0802EA48 + 1
	.set sub_802EA88, 0x0802EA88 + 1
	.set sub_803BD70, 0x0803BD70 + 1
	.section .text.sub_807CA10, "ax", %progbits
@ MuCtr_GenMoveScript @ JP 0x0807CA10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MuCtr_GenMoveScript
	.thumb_func
MuCtr_GenMoveScript:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	movs r7, #0
	ldrsb r7, [r5, r7]
	movs r6, #2
	ldrsb r6, [r5, r6]
	cmp r2, #0
	bne _0807CA44
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldr r2, [r2, #0x38]
	bl GenerateExtendedMovementMapOnRange
	ldr r2, _0807CA40 @ =0x02033EF8
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_801A304
	b _0807CAB0
	.align 2, 0
_0807CA40: .4byte 0x02033EF8
_0807CA44:
	bl sub_802EA48
	ldr r0, _0807CA64 @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807CA68
	movs r0, #1
	strb r0, [r1]
	movs r5, #1
	b _0807CA7E
	.align 2, 0
_0807CA64: .4byte 0x0202E4D8
_0807CA68:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_803BD70
	movs r7, #0
	ldrsb r7, [r5, r7]
	movs r6, #2
	ldrsb r6, [r5, r6]
	movs r5, #0
_0807CA7E:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldr r2, [r2, #0x38]
	bl GenerateExtendedMovementMapOnRange
	ldr r2, _0807CAB8 @ =0x02033EF8
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_801A304
	cmp r5, #1
	bne _0807CAAC
	ldr r0, _0807CABC @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r7
	movs r1, #0
	strb r1, [r0]
_0807CAAC:
	bl sub_802EA88
_0807CAB0:
	ldr r0, _0807CAB8 @ =0x02033EF8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807CAB8: .4byte 0x02033EF8
_0807CABC: .4byte 0x0202E4D8

