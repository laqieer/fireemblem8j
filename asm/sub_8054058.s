	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8056964, 0x08056964 + 1
	.section .text.sub_8054058, "ax", %progbits
@ sub_8054058 @ JP 0x08054058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8054058
	.thumb_func
sub_8054058:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08054094
	movs r0, #0
	bl sub_8056964
	ldr r0, _08054090 @ =0x020244A8
	movs r1, #0xf0
	lsls r1, r1, #8
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r4, #0
	bl sub_8002DE4
	b _080540B6
	.align 2, 0
_08054090: .4byte 0x020244A8
_08054094:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
_080540B6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

