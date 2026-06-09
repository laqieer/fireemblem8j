	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_807F7A8, "ax", %progbits
@ sub_807F7A8 @ JP 0x0807F7A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F7A8
	.thumb_func
sub_807F7A8:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _0807F7BC
	adds r0, r5, #0
	bl sub_8002DE4
	b _0807F80A
_0807F7BC:
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, [r5, #0x58]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl sub_8012E84
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5, #0x58]
	cmp r1, r0
	blt _0807F80A
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0807F814 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_8002DE4
_0807F80A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F814: .4byte 0x02023CA8

