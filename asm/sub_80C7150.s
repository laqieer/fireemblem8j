	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SkipGmNodeIconDisplay, 0x080C052C + 1
	.set sub_80C70B4, 0x080C70B4 + 1
	.section .text.sub_80C7150, "ax", %progbits
@ sub_80C7150 @ JP 0x080C7150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7150
	.thumb_func
sub_80C7150:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C71C8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl SkipGmNodeIconDisplay
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	bl sub_80C70B4
	ldr r2, _080C71CC @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	ands r1, r0
	movs r3, #1
	orrs r1, r3
	strb r1, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	ldrb r0, [r2, #1]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, _080C71D0 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080C71D4 @ =0x08AC24B0
	bl Proc_EndEach
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C71C8: .4byte 0x08AC1108
_080C71CC: .4byte 0x03003020
_080C71D0: .4byte 0x03005270
_080C71D4: .4byte 0x08AC24B0

