	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set AllocWeatherParticles, 0x08030144 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_80303C4, "ax", %progbits
@ sub_80303C4 @ JP 0x080303C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80303C4
	.thumb_func
sub_80303C4:
	push {r4, r5, r6, lr}
	ldr r0, _08030420 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _08030424 @ =0x085CBE84
	ldr r4, _08030428 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _0803042C @ =0x06010380
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl sub_80130D8
	movs r6, #0
	ldr r4, _08030430 @ =0x020027DC
	movs r5, #0x3f
_080303EA:
	bl AdvanceGetLCGRNValue
	strh r0, [r4]
	bl AdvanceGetLCGRNValue
	movs r1, #0xa0
	bl __umodsi3
	adds r0, #0xf0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #2]
	bl AdvanceGetLCGRNValue
	movs r1, #7
	ands r0, r1
	subs r0, #0x20
	strh r0, [r4, #4]
	strh r6, [r4, #6]
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _080303EA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030420: .4byte 0x0202BCEC
_08030424: .4byte 0x085CBE84
_08030428: .4byte 0x02020188
_0803042C: .4byte 0x06010380
_08030430: .4byte 0x020027DC

