	.syntax unified
	.set EkrDispUP_SetPositionUnsync, 0x08052840 + 1
	.set SyncEkrDispUP, 0x08052868 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80527EC, 0x080527EC + 1
	.section .text.sub_8057E2C, "ax", %progbits
@ sub_8057E2C @ JP 0x08057E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057E2C
	.thumb_func
sub_8057E2C:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08057E60
	ldr r0, _08057E5C @ =0x0201FAD0
	movs r1, #0
	str r1, [r0]
	bl SyncEkrDispUP
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne _08057E54
	bl sub_80527EC
_08057E54:
	adds r0, r4, #0
	bl sub_8002DE4
	b _08057E9E
	.align 2, 0
_08057E5C: .4byte 0x0201FAD0
_08057E60:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08057E80
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8012E84
	b _08057E94
_08057E80:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl sub_8012E84
_08057E94:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
_08057E9E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

