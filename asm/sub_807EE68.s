	.syntax unified
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_807EE68, "ax", %progbits
@ sub_807EE68 @ JP 0x0807EE68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807EE68
	.thumb_func
sub_807EE68:
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807EEB4 @ =0x08A1C72C
	ldr r1, _0807EEB8 @ =0x06013000
	bl sub_8013008
	ldr r0, _0807EEBC @ =0x08A1C81C
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r3, _0807EEC0 @ =0x0202BCAC
	ldrh r2, [r3, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #4
	adds r1, #8
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r3, [r3, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	subs r2, r2, r3
	lsls r2, r2, #4
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8009608
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EEB4: .4byte 0x08A1C72C
_0807EEB8: .4byte 0x06013000
_0807EEBC: .4byte 0x08A1C81C
_0807EEC0: .4byte 0x0202BCAC

