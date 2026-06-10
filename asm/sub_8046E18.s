	.syntax unified
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8042D6C, 0x08042D6C + 1
	.section .text.sub_8046E18, "ax", %progbits
@ sub_8046E18 @ JP 0x08046E18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046E18
	.thumb_func
sub_8046E18:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x18]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	mov r3, sb
	bl sub_80043B8
	adds r0, r5, #0
	movs r1, #0x58
	movs r2, #2
	adds r3, r4, #0
	bl sub_8042D6C
	movs r0, #0x5c
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x60
	movs r2, #3
	bl sub_80043B8
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #2
	adds r3, r6, #0
	bl sub_8042D6C
	movs r0, #0x5e
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x88
	movs r2, #0
	bl sub_80043B8
	adds r0, r5, #0
	movs r1, #0x94
	movs r2, #2
	mov r3, r8
	bl sub_8042D6C
	movs r0, #0x60
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x9c
	movs r2, #0
	bl sub_80043B8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

