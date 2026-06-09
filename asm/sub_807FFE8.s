	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set UpdateMapAnimScanline, 0x08084264 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80096B0, 0x080096B0 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_807FFE8, "ax", %progbits
@ sub_807FFE8 @ JP 0x0807FFE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FFE8
	.thumb_func
sub_807FFE8:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r3, [r4]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl sub_8012E84
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #8
	ldr r1, [r5, #0x34]
	adds r1, #8
	bl UpdateMapAnimScanline
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #4
	movs r1, #0x28
	bl __divsi3
	cmp r0, #0xf
	ble _08080026
	movs r0, #0x10
_08080026:
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r4]
	cmp r0, #0x27
	bls _08080044
	adds r0, r5, #0
	bl sub_8002DE4
	bl sub_80096B0
_08080044:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

