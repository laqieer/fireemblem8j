	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set AllocWeatherParticles, 0x08030144 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80307B8, "ax", %progbits
@ sub_80307B8 @ JP 0x080307B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80307B8
	.thumb_func
sub_80307B8:
	push {r4, r5, r6, lr}
	ldr r0, _08030804 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _08030808 @ =0x085CBFA4
	ldr r1, _0803080C @ =0x06010300
	bl sub_8013008
	ldr r0, _08030810 @ =0x085CBFE4
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r5, _08030814 @ =0x080DCC20
	ldr r4, _08030818 @ =0x020027DC
	movs r6, #0xf
_080307DC:
	bl AdvanceGetLCGRNValue
	strh r0, [r4]
	bl AdvanceGetLCGRNValue
	strh r0, [r4, #2]
	ldrh r0, [r5]
	rsbs r0, r0, #0
	strh r0, [r4, #4]
	ldrh r0, [r5, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #6]
	adds r5, #6
	adds r4, #0xc
	subs r6, #1
	cmp r6, #0
	bge _080307DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030804: .4byte 0x0202BCEC
_08030808: .4byte 0x085CBFA4
_0803080C: .4byte 0x06010300
_08030810: .4byte 0x085CBFE4
_08030814: .4byte 0x080DCC20
_08030818: .4byte 0x020027DC

