	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8035554, "ax", %progbits
@ sub_8035554 @ JP 0x08035554 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035554
	.thumb_func
sub_8035554:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0803557C @ =0x0202BCAC
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _08035576
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl sub_8002DE4
_08035576:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803557C: .4byte 0x0202BCAC

