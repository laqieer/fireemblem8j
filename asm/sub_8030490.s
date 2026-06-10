	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set AllocWeatherParticles, 0x08030144 + 1
	.set memset, 0x080D6968 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_8030490, "ax", %progbits
@ sub_8030490 @ JP 0x08030490 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030490
	.thumb_func
sub_8030490:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, _080304FC @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _08030500 @ =0x085CBF0C
	ldr r4, _08030504 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _08030508 @ =0x06010300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #4
	bl sub_80130D8
	movs r6, #0
	ldr r5, _0803050C @ =0x020027DC
	ldr r0, _08030510 @ =0x000001FF
	adds r7, r0, #0
_080304CC:
	movs r0, #7
	ands r0, r6
	add r0, sp
	ldrb r4, [r0]
	bl AdvanceGetLCGRNValue
	strh r0, [r5]
	bl AdvanceGetLCGRNValue
	strh r0, [r5, #2]
	bl AdvanceGetLCGRNValue
	ldr r2, _08030514 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08030518 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r5, #6]
	strb r4, [r5, #8]
	cmp r4, #0
	beq _0803051C
	cmp r4, #1
	beq _0803052A
	b _0803053A
	.align 2, 0
_080304FC: .4byte 0x0202BCEC
_08030500: .4byte 0x085CBF0C
_08030504: .4byte 0x02020188
_08030508: .4byte 0x06010300
_0803050C: .4byte 0x020027DC
_08030510: .4byte 0x000001FF
_08030514: .4byte 0x000003FF
_08030518: .4byte 0xFFFFFF00
_0803051C:
	bl AdvanceGetLCGRNValue
	ands r0, r7
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r0, r2
	b _08030538
_0803052A:
	bl AdvanceGetLCGRNValue
	ands r0, r7
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r0, r0, r1
_08030538:
	strh r0, [r5, #4]
_0803053A:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _080304CC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

