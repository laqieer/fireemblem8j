	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8062C14, "ax", %progbits
@ sub_8062C14 @ JP 0x08062C14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062C14
	.thumb_func
sub_8062C14:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08062CD6
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062C7E
	ldr r0, _08062C60 @ =0x086A3298
	mov r8, r0
	ldr r7, _08062C64 @ =0x086A4898
	ldr r0, _08062C68 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08062C6C
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x88
	cmp r0, #0
	bne _08062C7A
	movs r5, #0x68
	b _08062C7A
	.align 2, 0
_08062C60: .4byte 0x086A3298
_08062C64: .4byte 0x086A4898
_08062C68: .4byte 0x0203E11C
_08062C6C:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x70
	cmp r0, #0
	bne _08062C7A
	movs r5, #0x80
_08062C7A:
	movs r6, #0x4e
	b _08062CBC
_08062C7E:
	ldr r2, _08062CA0 @ =0x086A330C
	mov r8, r2
	ldr r7, _08062CA4 @ =0x086A490C
	ldr r0, _08062CA8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08062CAC
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x4c
	cmp r0, #0
	bne _08062CBA
	movs r5, #0xa4
	b _08062CBA
	.align 2, 0
_08062CA0: .4byte 0x086A330C
_08062CA4: .4byte 0x086A490C
_08062CA8: .4byte 0x0203E11C
_08062CAC:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x64
	cmp r0, #0
	bne _08062CBA
	movs r5, #0x8c
_08062CBA:
	movs r6, #0x40
_08062CBC:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl sub_8002DE4
_08062CD6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

