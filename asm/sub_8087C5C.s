	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8026BC0, 0x08026BC0 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_8087C5C, "ax", %progbits
@ sub_8087C5C @ JP 0x08087C5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087C5C
	.thumb_func
sub_8087C5C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x54]
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_8026BC0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _08087C94
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshEntityBmMaps
	bl sub_8027144
	adds r0, r6, #0
	bl sub_8002DE4
_08087C94:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

