	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_801C064, "ax", %progbits
@ DebugMenu_FogDraw @ JP 0x0801C064 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DebugMenu_FogDraw
	.thumb_func
DebugMenu_FogDraw:
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r3, _0801C0C4 @ =0x080DC704
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl sub_80043B8
	ldr r2, _0801C0C8 @ =0x085C2EFC
	ldr r0, _0801C0CC @ =0x0202BCEC
	ldrb r1, [r0, #0xd]
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C0D0 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C0C4: .4byte 0x080DC704
_0801C0C8: .4byte 0x085C2EFC
_0801C0CC: .4byte 0x0202BCEC
_0801C0D0: .4byte 0x02022CA8

