	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8053EFC, "ax", %progbits
@ sub_8053EFC @ JP 0x08053EFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053EFC
	.thumb_func
sub_8053EFC:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08053F50
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08053F4C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	bl SetDefaultColorEffects
	adds r0, r4, #0
	bl sub_8002DE4
	b _08053F72
	.align 2, 0
_08053F4C: .4byte 0xFFFFFBFF
_08053F50:
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
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
_08053F72:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

