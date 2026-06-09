	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SkipGmNodeIconDisplay, 0x080C052C + 1
	.set sub_80C70B4, 0x080C70B4 + 1
	.section .text.sub_80C72B0, "ax", %progbits
@ sub_80C72B0 @ JP 0x080C72B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C72B0
	.thumb_func
sub_80C72B0:
	push {r4, r5, lr}
	ldr r0, _080C733C @ =0x08AC2510
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080C7336
	ldr r0, _080C7340 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl SkipGmNodeIconDisplay
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	bl sub_80C70B4
	ldr r2, _080C7344 @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	ldr r3, _080C7348 @ =0x03005270
	ldrb r1, [r3]
	movs r4, #9
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	ands r0, r4
	subs r1, #0xc
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080C734C @ =0x08AC24B0
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_End
_080C7336:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C733C: .4byte 0x08AC2510
_080C7340: .4byte 0x08AC1108
_080C7344: .4byte 0x03003020
_080C7348: .4byte 0x03005270
_080C734C: .4byte 0x08AC24B0

