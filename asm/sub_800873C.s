	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckTalkFlag, 0x080069E0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_800873C, "ax", %progbits
@ sub_800873C @ JP 0x0800873C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800873C
	.thumb_func
sub_800873C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	rsbs r1, r1, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_8012E84
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckTalkFlag
	cmp r0, #0
	bne _0800878E
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #1
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
_0800878E:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne _0800879A
	adds r0, r5, #0
	bl sub_8002DE4
_0800879A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

