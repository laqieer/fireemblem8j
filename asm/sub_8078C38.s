	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.set SetEkrDragonStatusUnk1, 0x08072054 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.set sub_8078DC8, 0x08078DC8 + 1
	.section .text.sub_8078C38, "ax", %progbits
@ sub_8078C38 @ JP 0x08078C38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078C38
	.thumb_func
sub_8078C38:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetEkrDragonStatusUnk1
	ldr r3, _08078CB0 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _08078CB4 @ =0x0203E100
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	bl sub_8078DC8
	ldr r0, _08078CB8 @ =0x020244A8
	ldr r1, _08078CBC @ =0x0000601F
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #0x10
	bl sub_8073B80
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078CB0: .4byte 0x03003020
_08078CB4: .4byte 0x0203E100
_08078CB8: .4byte 0x020244A8
_08078CBC: .4byte 0x0000601F

