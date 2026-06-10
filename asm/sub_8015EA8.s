	.syntax unified
	.set GetCameraAdjustedX, 0x080159D4 + 1
	.set GetCameraAdjustedY, 0x08015A18 + 1
	.section .text.sub_8015EA8, "ax", %progbits
@ sub_8015EA8 @ JP 0x08015EA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015EA8
	.thumb_func
sub_8015EA8:
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #4
	bl GetCameraAdjustedX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #4
	adds r0, r5, #0
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08015EDC @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _08015EE0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bne _08015EE0
	movs r0, #0
	b _08015EE2
	.align 2, 0
_08015EDC: .4byte 0x0202BCAC
_08015EE0:
	movs r0, #1
_08015EE2:
	pop {r4, r5}
	pop {r1}
	bx r1

