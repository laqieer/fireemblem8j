	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_800F0FC, "ax", %progbits
@ sub_800F0FC @ JP 0x0800F0FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F0FC
	.thumb_func
sub_800F0FC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x14
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	blt _0800F14A
	cmp r0, #1
	ble _0800F120
	cmp r0, #2
	beq _0800F136
	b _0800F14A
_0800F120:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	b _0800F14A
_0800F136:
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
_0800F14A:
	cmp r4, #0xf
	bls _0800F154
	adds r0, r5, #0
	bl sub_8002DE4
_0800F154:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

