	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80139E0, 0x080139E0 + 1
	.section .text.sub_807BC18, "ax", %progbits
@ sub_807BC18 @ JP 0x0807BC18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BC18
	.thumb_func
sub_807BC18:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, [r5, #0x30]
	ldr r0, [r5, #0x34]
	adds r3, r5, #0
	adds r3, #0x46
	movs r6, #0xa0
	lsls r6, r6, #7
	adds r1, r6, #0
	ldrh r3, [r3]
	adds r1, r1, r3
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0807BC64 @ =0x020228A8
	adds r0, r0, r1
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _0807BC68 @ =0x08A12FA8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x15
	movs r2, #8
	adds r3, r5, #0
	bl sub_80139E0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BC64: .4byte 0x020228A8
_0807BC68: .4byte 0x08A12FA8

