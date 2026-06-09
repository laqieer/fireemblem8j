	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805E2FC, "ax", %progbits
@ sub_805E2FC @ JP 0x0805E2FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E2FC
	.thumb_func
sub_805E2FC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805E320 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E32E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E324
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x48
	b _0805E32C
	.align 2, 0
_0805E320: .4byte 0x0203E11C
_0805E324:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x48
_0805E32C:
	strh r0, [r1, #2]
_0805E32E:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0805E354
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805E35C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0805E354:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E35C: .4byte 0x0201774C

