	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set AllocWeatherParticles, 0x08030144 + 1
	.section .text.sub_80301A8, "ax", %progbits
@ sub_80301A8 @ JP 0x080301A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80301A8
	.thumb_func
sub_80301A8:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _08030210 @ =0x080DCC80
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, _08030214 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r6, #0
	ldr r7, _08030218 @ =0x080DCC20
	ldr r5, _0803021C @ =0x020027DC
_080301C2:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl AdvanceGetLCGRNValue
	strh r0, [r5]
	bl AdvanceGetLCGRNValue
	strh r0, [r5, #2]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #9]
	ldrh r0, [r4]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _080301C2
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030210: .4byte 0x080DCC80
_08030214: .4byte 0x0202BCEC
_08030218: .4byte 0x080DCC20
_0803021C: .4byte 0x020027DC

