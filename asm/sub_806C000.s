	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806BE8C, 0x0806BE8C + 1
	.set sub_806BF3C, 0x0806BF3C + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_806C000, "ax", %progbits
@ sub_806C000 @ JP 0x0806C000 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C000
	.thumb_func
sub_806C000:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x57
	ble _0806C016
	b _0806C194
_0806C016:
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	subs r0, #3
	cmp r0, #0
	ble _0806C0E2
	movs r1, #6
	bl sub_80D637C
	cmp r0, #0
	bne _0806C0E2
	ldr r0, [r6, #0x44]
	cmp r0, #5
	bhi _0806C0D4
	lsls r0, r0, #2
	ldr r1, _0806C03C @ =_0806C040
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C03C: .4byte _0806C040
_0806C040: @ jump table
	.4byte _0806C058 @ case 0
	.4byte _0806C060 @ case 1
	.4byte _0806C070 @ case 2
	.4byte _0806C08C @ case 3
	.4byte _0806C09C @ case 4
	.4byte _0806C0BA @ case 5
_0806C058:
	ldr r0, [r6, #0x5c]
	movs r1, #0x40
	rsbs r1, r1, #0
	b _0806C0A2
_0806C060:
	ldr r0, [r6, #0x5c]
	movs r1, #0x80
	rsbs r1, r1, #0
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #0xf0
	lsls r3, r3, #3
	b _0806C0AA
_0806C070:
	ldr r0, [r6, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #0x90
	lsls r3, r3, #4
	movs r1, #0x2c
	ldrsh r4, [r6, r1]
	movs r1, #0x62
	subs r1, r1, r4
	str r1, [sp]
	movs r1, #0
	bl sub_806BE8C
	b _0806C0D4
_0806C08C:
	ldr r0, [r6, #0x5c]
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #0x90
	lsls r3, r3, #4
	b _0806C0AA
_0806C09C:
	ldr r0, [r6, #0x5c]
	movs r1, #0x80
	rsbs r1, r1, #0
_0806C0A2:
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #0xa8
	lsls r3, r3, #4
_0806C0AA:
	movs r4, #0x2c
	ldrsh r5, [r6, r4]
	movs r4, #0x62
	subs r4, r4, r5
	str r4, [sp]
	bl sub_806BE8C
	b _0806C0D4
_0806C0BA:
	ldr r0, [r6, #0x5c]
	movs r2, #0x10
	rsbs r2, r2, #0
	movs r3, #0xf0
	lsls r3, r3, #3
	movs r1, #0x2c
	ldrsh r4, [r6, r1]
	movs r1, #0x62
	subs r1, r1, r4
	str r1, [sp]
	movs r1, #0
	bl sub_806BE8C
_0806C0D4:
	ldr r0, [r6, #0x44]
	adds r0, #1
	str r0, [r6, #0x44]
	cmp r0, #6
	bne _0806C0E2
	movs r0, #0
	str r0, [r6, #0x44]
_0806C0E2:
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	subs r0, #1
	cmp r0, #0
	ble _0806C194
	movs r1, #6
	bl sub_80D637C
	cmp r0, #0
	bne _0806C194
	ldr r0, [r6, #0x48]
	cmp r0, #5
	bhi _0806C186
	lsls r0, r0, #2
	ldr r1, _0806C108 @ =_0806C10C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C108: .4byte _0806C10C
_0806C10C: @ jump table
	.4byte _0806C124 @ case 0
	.4byte _0806C12C @ case 1
	.4byte _0806C138 @ case 2
	.4byte _0806C144 @ case 3
	.4byte _0806C150 @ case 4
	.4byte _0806C16C @ case 5
_0806C124:
	ldr r0, [r6, #0x5c]
	movs r1, #0x18
	rsbs r1, r1, #0
	b _0806C156
_0806C12C:
	ldr r0, [r6, #0x5c]
	movs r1, #0x38
	rsbs r1, r1, #0
	movs r3, #0xf0
	lsls r3, r3, #2
	b _0806C15A
_0806C138:
	ldr r0, [r6, #0x5c]
	movs r1, #0x58
	rsbs r1, r1, #0
	movs r3, #0x90
	lsls r3, r3, #3
	b _0806C15A
_0806C144:
	ldr r0, [r6, #0x5c]
	movs r1, #0x18
	rsbs r1, r1, #0
	movs r3, #0x90
	lsls r3, r3, #3
	b _0806C15A
_0806C150:
	ldr r0, [r6, #0x5c]
	movs r1, #0x38
	rsbs r1, r1, #0
_0806C156:
	movs r3, #0xa8
	lsls r3, r3, #3
_0806C15A:
	movs r2, #0x2c
	ldrsh r4, [r6, r2]
	movs r2, #0x62
	subs r2, r2, r4
	str r2, [sp]
	movs r2, #0
	bl sub_806BF3C
	b _0806C186
_0806C16C:
	ldr r0, [r6, #0x5c]
	movs r1, #0x58
	rsbs r1, r1, #0
	movs r3, #0xf0
	lsls r3, r3, #2
	movs r2, #0x2c
	ldrsh r4, [r6, r2]
	movs r2, #0x62
	subs r2, r2, r4
	str r2, [sp]
	movs r2, #0
	bl sub_806BF3C
_0806C186:
	ldr r0, [r6, #0x48]
	adds r0, #1
	str r0, [r6, #0x48]
	cmp r0, #6
	bne _0806C194
	movs r0, #0
	str r0, [r6, #0x48]
_0806C194:
	movs r4, #0x2c
	ldrsh r0, [r6, r4]
	cmp r0, #0x60
	bne _0806C1A2
	adds r0, r6, #0
	bl sub_8002DE4
_0806C1A2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

